<?php

namespace App\Models;


use CodeIgniter\Model;

class Work extends Model{

    protected $table            = 'work';
    protected $primaryKey       = 'id';
    protected $allowedFields    = ['created_at', 'finish_at', 'observation', 'document', 'documento_id_documento', 'users_id', 'work_type_id'];

    protected function getUser(){
        if(!empty($this->attributes['users_id'])){
            $uiModel = model('User');
            $uiModel->where('id', $this->attributes['users_id'])->first();
        }
        return $this;
    }
}