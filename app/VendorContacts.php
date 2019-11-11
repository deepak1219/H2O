<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VendorContacts extends Model
{
	/**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id', 'address', 'business_name', 'registration_no', 'contact_no', 'geo_points'
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
     * Get the user that owns the contact.
     */
    public function user()
    {
        return $this->belongsTo('App\User');
    }
	
	/**
     * Get the vendor services.
     */
    public function services()
    {
        return $this->hasMany('App\VendorServices', 'vendor_id')->where('is_active', true);
    }
}
