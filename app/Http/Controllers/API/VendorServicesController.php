<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\VendorServices;
use App\User;

use Validator;

class VendorServicesController extends Controller
{
    /** 
     * vendor service Details create/update api 
     * 
     * @return \Illuminate\Http\Response 
     */
    public function store(Request $request) {
		$user = $request->user();
		if($user && in_array(User::$roles[1], $user->roles) && isset($user->vendor->id)) {
			$input = $request->all();			
			$validator = Validator::make($input, [ 
				'id' => 'numeric',
				'water_cat_id' => 'required|numeric', 
				'water_brand_id' => 'required|numeric', 
				'water_no_litres' => 'required|regex:/^\d+(\.\d{1,2})?$/',
				'actual_amount' => 'required|regex:/^\d+(\.\d{1,2})?$/',
				'tax_amount' => 'required|regex:/^\d+(\.\d{1,2})?$/',
				'is_active' => 'boolean',
			]);
			if ($validator->fails()) {
				return response()->json(['error'=>$validator->errors()], 401);            
			}
			// update service
			if(isset($input['id'])) {
				VendorServices::where('id', $input['id'])->update($input);
			}
			else { // create new service
				$input['vendor_id'] = $user->vendor->id;
				VendorServices::create($input);
			}
			return response()->json(['success'=> 'service stored successfully.'], 201);
		}
		return response()->json(['error'=>'Invalid vendor.'], 401);
	}
}
