<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Document;
use App\Models\User;

class AssignDocumentsToUsers extends Command
{
    protected $signature = 'assign:documents-to-users';
    protected $description = 'Assigns existing documents to users';

    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        // Example logic: Assign all documents to the first user
        $user = User::first();

        if (!$user) {
            $this->error('No users found.');
            return;
        }

        Document::whereNull('user_id')->update(['user_id' => $user->id]);

        $this->info('Documents assigned to user ID: ' . $user->id);
    }
}
