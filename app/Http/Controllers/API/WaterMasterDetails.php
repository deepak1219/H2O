<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\WaterBrands, App\WaterCategories;

class WaterMasterDetails extends Controller
{
    /**
     * master data
     *
     * @return \Illuminate\Http\Response
     */
    public function getData(Request $request)
    {
		$details = [];
        $details['water_brands'] = WaterBrands::where('is_active', true)
               ->orderBy('name', 'desc')
               ->get();
		$details['water_categories'] = WaterCategories::where('is_active', true)
               ->orderBy('name', 'desc')
               ->get();
        return response()->json(['success' => $details], 200); 
    }
}
