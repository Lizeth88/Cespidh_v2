<?php


namespace App\Models;


use CodeIgniter\Model;

class DocumentoEstado extends Model
{
    protected $primaryKey = 'id';
    protected $table = 'documento_estado';
    protected $allowedFields    = ['id_estado', 'nombre'];

}