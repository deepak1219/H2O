<?php
namespace App\Http\Controllers\API;
use Illuminate\Http\Request; 
use App\Http\Controllers\Controller; 

use App\User;
use App\WaterCart;

use Illuminate\Support\Facades\Auth; 
use Validator;
use Illuminate\Support\Str;

class UserController extends Controller 
{
	public $successStatus = 200;
/** 
     * login api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function login(){ 
        if(Auth::attempt(['email' => request('email'), 'password' => request('password')])){ 
            $user = Auth::user();
			if(!$user->is_active) {
				return response()->json(['error' => 'Account is not active'], 401);
			}
            $success['token'] =  $user->createToken('MyApp')-> accessToken; 
            return response()->json(['success' => $success], $this-> successStatus); 
        } 
        else{ 
            return response()->json(['error'=>'Unauthorised'], 401); 
        } 
    }
/** 
     * Register api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function register(Request $request) 
    { 
        $validator = Validator::make($request->all(), [ 
            'name' => 'required|string', 
            'email' => 'required|string|email|unique:users', 
            'password' => 'required|string', 
            'c_password' => 'required|string|same:password',
			'roles' => [
				'required',
				'string',
				function ($attribute, $value, $fail) {
					if(!in_array($value, User::$roles)) {
						$fail($attribute.' is invalid.');
					}
				},
			],
        ]);
		if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }
		
		$input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $input['is_active'] = true;
        $input['activation_token'] = Str::random(40);
		
        $user = User::create($input);
		$user->addRole($input['roles']);
		$user->save();
		
        $success['token'] =  $user->createToken('MyApp')->accessToken; 
        $success['name'] =  $user->name;
		return response()->json(['success'=>$success], $this->successStatus); 
    }
	
	/**
     * Logout user (Revoke the token)
     *
     * @return \Illuminate\Http\Response
     */
    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        return response()->json([
            'message' => 'Successfully logged out'], $this->successStatus);
    }
/** 
     * user Details api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function userDetails(Request $request) 
    { 
        $user = $request->user();
		if(in_array(User::$roles[1], $user->roles)) { // vendor role
			$user->vendor;
			$user->vendor->services;
		}
		else if(in_array(User::$roles[0], $user->roles)){
			$user->cart = WaterCart::getCartItems($user->id);			
		}
		/*
		$result = [];
		$result['user'] = $user;
		if(in_array(User::$roles[1], $user->roles)) {
			$result['vendor'] = $user->vendor;
		}
		*/
        return response()->json(['success' => $user], $this->successStatus); 
    } 
}