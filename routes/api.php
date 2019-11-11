<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
/*
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
}); */

Route::post('login', 'API\UserController@login');
Route::post('register', 'API\UserController@register');

Route::group(['middleware' => 'auth:api'], function(){
	Route::get('userDetails', 'API\UserController@userDetails');
	Route::get('logout', 'API\UserController@logout');
	Route::post('vendorContact', 'API\VendorContactController@store');	
	Route::post('vendorService', 'API\VendorServicesController@store');
	Route::post('cartItemStore', 'API\WaterCartController@store');
	Route::delete('cartItemDelete', 'API\WaterCartController@remove');
});

Route::get('waterMasterDetails', 'API\WaterMasterDetails@getData');
Route::get('vendorContacts', 'API\VendorContactController@getAll');
