<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;

use Spatie\Permission\Models\Role;

use Spatie\Permission\Models\Permission;

class CreateAdminUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
            $user = User::create([

            'name' => 'Hardik57826 Savani', 

            'email' => 'rita58@gmail.com',

            'password' => bcrypt('12345678')

        ]);
       


    

       $role = Role::create(['name' => 'admin']);

     

        $permissions = Permission::pluck('id','id')->all();

   

        $role->syncPermissions($permissions);

     

        $user->assignRole([$role->name]);
    }
}