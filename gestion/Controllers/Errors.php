<?php
class Errors extends Controller
{
    public function __construct()
    {
        parent::__construct();
        session_start();
    }

    public function index()
    {
        $data['title'] = 'Página no encontrada';
        $this->views->getView('principal', 'errors', $data);
    }
}
