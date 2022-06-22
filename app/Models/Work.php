<?php

namespace App\Models;


use CodeIgniter\Model;

class Work extends Model{

    protected $table            = 'work';
    protected $primaryKey       = 'id';
    protected $allowedFields    = ['observation', 'document', 'documento_id_documento', 'users_id', 'work_type_id'];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'finish_at';
    
}