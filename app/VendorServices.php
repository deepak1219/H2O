<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VendorServices extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'vendor_id', 'water_cat_id', 'water_brand_id', 'water_no_litres', 'actual_amount', 'tax_amount'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'is_active'
    ];
	
    /**
     * Get the vendor that owns the service.
     */
    public function vendor()
    {
        return $this->belongsTo('App\VendorContacts', 'vendor_id');
    }
	
	/**
     * Get the WaterBrand that owns the service.
     */
    public function waterBrand()
    {
        return $this->belongsTo('App\WaterBrands', 'water_brand_id');
    }
	
	/**
     * Get the WaterCategory that owns the service.
     */
    public function waterCategory()
    {
        return $this->belongsTo('App\WaterCategories', 'water_cat_id');
    }
}
