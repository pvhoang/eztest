<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Models\User;

class UserController extends Controller
{
    public function viewAll()
    {
        Log::warning("viewAll");
        $users = User::all();
        return response()->json($users);
    }

    public function view($id)
    {
        Log::warning("view: " . $id);
        $user = User::find($id);
        if (!empty($user)) {
            return response()->json($user);
        } else {
            return response()->json([
                "message" => "User not found"
            ], 404);
        }
    }

    public function insert(Request $request)
    {
        Log::warning("insert: " . $request);
        $user = new User;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = $request->password;
        $user->save();
        return response()->json([
            "message" => "User added"
        ], 201);
    }

    public function update(Request $request, $id)
    {
        Log::warning("update: " . $id. ' - ' . $request);

        if (User::where('id', $id)->exists()) {
            $user = User::find($id);
            $user->name = is_null($request->name) ? $user->name : $request->name;
            $user->email = is_null($request->email) ? $user->email : $request->email;
            $user->password = is_null($request->password) ? $user->password : $request->password;
            $user->save();
            return response()->json([
                "message" => "User updated."
            ], 404);

        } else {
            return response()->json([
                "message" => "User not found"
            ], 404);
        }
    }

    public function delete($id) {

        Log::warning("delete: " . $id);

        if (User::where('id', $id)->exists()) {
            $user = User::find($id);
            $user->delete();
            return response()->json([
                "message" => "User deleted!"
            ], 202);
        } else {
            return response()->json([
                "message" => "User not found"
            ], 404);
        }
    }

}
