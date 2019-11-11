<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class WaterCart extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id', 'service_id', 'quantity'
    ];
	
    /**
     * Get the user that owns the service.
     */
    public function user()
    {
        return $this->belongsTo('App\User');
    }
	
	/**
     * Get the vendor service that owns the service.
     */
    public function service()
    {
        return $this->belongsTo('App\VendorServices', 'service_id');
    }
	
	public static function getCartItems($userId) {
		$items = DB::table('water_carts as wc')
            ->select('wc.id', 'wc.service_id', 'wc.quantity', 'vs.vendor_id', 'vs.water_cat_id', 'vs.water_brand_id', 'vs.water_no_litres', 'vs.actual_amount', 'vs.tax_amount', 'wb.name as water_brand_name', 'wct.name as water_category_name')
            ->join('vendor_services as vs', 'vs.id', '=', 'wc.service_id')
            ->join('water_brands as wb', 'wb.id', '=', 'vs.water_brand_id')
            ->join('water_categories as wct', 'wct.id', '=', 'vs.water_cat_id')
			->where('wc.user_id', '=', $userId)
            ->get();
		return $items;
	}
}
