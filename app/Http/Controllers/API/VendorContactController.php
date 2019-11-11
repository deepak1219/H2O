<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\VendorContacts;
use APP\User;

use DB;
use Validator;

class VendorContactController extends Controller
{
	/** 
     * vendor Details create/update api 
     * 
     * @return \Illuminate\Http\Response 
     */
    public function store(Request $request) {
		$user = $request->user();
		if($user && in_array(User::$roles[1], $user->roles)) {
			$input = $request->all();			
			$validator = Validator::make($input, [ 
				'business_name' => 'required|string', 
				'registration_no' => 'required|string', 
				'contact_no' => 'required|string',
				'contact_no_alternate' => 'string',
				'address' => 'required|string',
				'position' => 'required|string',
				'timings' => 'json',
				'is_active' => 'boolean',
			]);
			if ($validator->fails()) { 
				return response()->json(['error'=>$validator->errors()], 401);            
			}
			//$input['position'] = DB::raw($input['position']);
			//echo "<pre>"; print_r($input); exit;
			// update contact
			if(isset($user->vendor->id)) {
				DB::table('vendor_contacts')->where('id', $user->vendor->id)->update($input);
			}
			else { // create new contact
				$input['user_id'] = $user->id;
				DB::table('vendor_contacts')->insert($input);
				//VendorContacts::create($input);
			}
			return response()->json(['success'=> 'contact stored successfully.'], 201);
		}
		return response()->json(['error'=>'Invalid vendor.'], 401);
	}
	
	/** 
     * get all vendor Details api 
     * 
     * @return \Illuminate\Http\Response 
     */
	public function getAll() {
		$vendors = VendorContacts::with('services')->get();
		return response()->json(['success'=> $vendors], 200);
	}
}
