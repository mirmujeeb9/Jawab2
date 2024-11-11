<?php

namespace App\Models;

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
    use HasFactory;

    protected $table = 'document';  
    
    protected $fillable = ['title', 'content', 'type', 'user_id'];

    // Define relationship to User
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
