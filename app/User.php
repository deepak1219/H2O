<?php

namespace App;

use Laravel\Passport\HasApiTokens;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable, SoftDeletes;

	protected $dates = ['deleted_at'];
	public static $roles = [
		'customer',
		'vendor',
		'admin',
	];
	
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'is_active', 'activation_token'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token', 'activation_token'
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
		'roles' => 'array',
    ];
	
	/**
     * Get the vendor details for the blog post.
     */
    public function vendor()
    {
        return $this->hasOne('App\VendorContacts')->where('is_active', true);
    }
	
	/**
     * Get the cart info.
     */
    public function cart()
    {
        return $this->hasMany('App\WaterCart', 'user_id');
    }
	
	/***
	 * @param string $role
	 * @return $this
	 */
	public function addRole(string $role) {
		$roles = $this->getRoles();
		$roles[] = $role;
		
		$roles = array_unique($roles);
		$this->setRoles($roles);

		return $this;
	}
	
	/**
	 * @param array $roles
	 * @return $this
	 */
	public function setRoles(array $roles)
	{
		$this->setAttribute('roles', $roles);
		return $this;
	}
	
	/***
	 * @param $role
	 * @return mixed
	 */
	public function hasRole($role)
	{
		return in_array($role, $this->getRoles());
	}
	
	/***
	 * @param $roles
	 * @return mixed
	 */
	public function hasRoles($roles)
	{
		$currentRoles = $this->getRoles();
		foreach($roles as $role) {
			if ( ! in_array($role, $currentRoles )) {
				return false;
			}
		}
		return true;
	}
	
	/**
	 * @return array
	 */
	public function getRoles()
	{
		$roles = $this->getAttribute('roles');

		if (is_null($roles)) {
			$roles = [];
		}

		return $roles;
	}
}
