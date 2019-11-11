<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\WaterCart;
use App\User;

use Validator;

class WaterCartController extends Controller
{
    /** 
     * Water Cart Details create/update api 
     * 
     * @return \Illuminate\Http\Response 
     */
    public function store(Request $request) {
		$user = $request->user();
		if($user && in_array(User::$roles[0], $user->roles)) {
			$input = $request->all();			
			$validator = Validator::make($input, [ 
				'id' => 'numeric', 
				'service_id' => 'required|numeric', 
				'quantity' => 'required|numeric',
			]);
			if ($validator->fails()) {
				return response()->json(['error'=>$validator->errors()], 401);            
			}
			// update service
			if(isset($input['id'])) {
				WaterCart::where('id', $input['id'])->update($input);
			}
			else { // create new service
				$input['user_id'] = $user->id;
				unset($input['id']);
				WaterCart::create($input);
			}
			return response()->json(['success'=> 'Cart item updated successfully.'], 201);
		}
		return response()->json(['error'=>'Invalid user.'], 401);
	}
	
	/** 
     * Water Cart Details delete api 
     * 
     * @return \Illuminate\Http\Response 
     */
    public function remove(Request $request) {
		$user = $request->user();
		if($user && in_array(User::$roles[0], $user->roles)) {
			$input = $request->all();
			$validator = Validator::make($input, [ 
				'id' => 'numeric'
			]);
			if ($validator->fails()) {
				return response()->json(['error'=>$validator->errors()], 401);            
			}
			
			WaterCart::where('id', $input['id'])->delete();			
			return response()->json(['success'=> 'Cart item updated successfully.'], 201);
		}
		return response()->json(['error'=>'Invalid user.'], 401);
	}
}
