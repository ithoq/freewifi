<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Users\Controller;

/**
 * Description of IndexController
 *
 * @author hieu
 */
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Session\Container;
use Dashboard\Model\Users;
use Dashboard\Model\UsersCode;
use Dashboard\Model\UsersCodeTable;
use Dashboard\Model\RadCheck;
use Register\Forms\RegisterForms;
use Zend\Session\SessionManager;
use Dashboard\Model\AppProductCategories;
use Dashboard\Model\AppProductCategoriesTable;
use Dashboard\Model\AppProducts;
use Dashboard\Model\AppProductsTable;

class UserController extends AbstractActionController {

    protected $usersTable;
    protected $usersCodeTable;
    protected $radCheckTable;
    protected $code;
    protected $urlLogin;
    protected $message;
    protected $appCategoryTable;

    public function __construct() {
        
    }

    public function getAppProductsTable() {
        if (!$this->appCategoryTable):
            $sm = $this->getServiceLocator();
            $this->appCategoryTable = $sm->get('Dashboard\Model\AppProductsTable');
        endif;
        return $this->appCategoryTable;
    }

    public function indexAction() {
        $renderer = $this->getServiceLocator()->get('Zend\View\Renderer\PhpRenderer');
        $renderer->headTitle('Users');
        $user = new Container('user');
        if (isset($user->name) && $user->name == 'guess' || !isset($user->name)):
            $this->redirect()->toRoute('login', array('action' => 'index', 'urlLogin' => 'users'));
        endif;

        $users = $this->getUsersTable();
        $items = $users->customGetData((int) $this->params()->fromQuery('page', 1), 10, array(), array(), array(), $page);
        $page->setCurrentPageNumber((int) $this->params()->fromQuery('page', 1));
        $page->setItemCountPerPage(10);
        //$items = $users->fetchAll();
        //do with payment
        
        $route = 'user-action';
        return new ViewModel(array(
            'message' => $this->message,
            'buttons' => array(
                'add' => array(
                    'route' => $route,
                    'action' => 'add'
                ),
                'edit' => array(
                    'route' => $route,
                    'action' => 'edit'
                ),
                'delete' => array(
                    'route' => $route,
                    'action' => 'delete'
                )
            ),
            'items' => $items,
            'paginator' => $page
        ));
    }

    public function addAction() {
        $form = new RegisterForms(null,array(),$this->getServiceLocator());
        $form->get('submit')->setValue('Add');
        $request = $this->getRequest();

        if ($request->isPost()) {
            $users = new Users();
            $form->setInputFilter($users->getInputFilter());
            $form->setData($request->getPost());
            if ($form->isValid()):
                $data = $form->getData();
                                
            endif;
        }
        $category = $this->getAppProductsTable();
        $category = $category->fetchAll();
        
        return new ViewModel(array(
            'form' => $form,
            'packet' => $category,
            'message' => $form->getMessages()
        ));
    }

    public function addUserAction() {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $fullname = $_POST['fullname'];
        $email = $_POST['email'];
        $phone = $_POST['phone'];
        $building = $_POST['building'];
        $packet = $_POST['packet'];
        $created = date();
        $room = $_POST['room'];
        $user = $this->getUsersTable();
        $u = new Users();
        $u->setUsername($username);
        $u->setPassword($password);
        $u->setFullname($fullname);
        $u->setEmail($email);
        $u->setPhone($phone);
        $u->setBuilding($building);
        $u->setPacket($packet);
        $u->setCreated($created);
        $u->setRoom($room);
        $user->save($u);
        return $this->redirect()->toRoute('users');
    }

    public function deleteAction() {
        $id = $_GET['id'];
        $user = $this->getUsersTable();
        $user->deleteUser($id);
        return $this->redirect()->toRoute('users');
    }

    public function editAction() {
        $id = $_GET['id'];
        $user = $this->getUsersTable();
        $user = $user->getUser($id);
        $category = $this->getAppProductsTable();
        $category = $category->fetchAll();
        return new ViewModel(array(
            'packet' => $category,
            'user' => $user
        ));
    }

    public function editUserAction() {
        $username = $_POST['username'];
        $id = $_POST['id'];
        $password = $_POST['password'];
        $fullname = $_POST['fullname'];
        $email = $_POST['email'];
        $phone = $_POST['phone'];
        $building = $_POST['building'];
        $packet = $_POST['packet'];
        $room = $_POST['room'];
        $created = date('dd/mm/yyyy');
        $user = $this->getUsersTable();
        $u = new Users();
        $u->setUsername($username);
        $u->setPassword($password);
        $u->setFullname($fullname);
        $u->setEmail($email);
        $u->setPhone($phone);
        $u->setBuilding($building);
        $u->setPacket($packet);
        $u->setCreated($created);
        $u->setRoom($room);
        $check = $this->getRadCheckTable();
        $usr = $user->getUser($id);
        $check2 = $check->getName($usr->getUsername());
        $check->removeCheck($check2->getId());
        $u2 = new RadCheck();
        $u2->setUsername($username);
        $u2->setAttribute($check2->getAttribute());
        $u2->setValue($email);
        $u2->setOp(':=');
        $check->save($u2);
        $u->setId($id);
        $user->deleteUser($id);
        $user->save($u);
        return $this->redirect()->toRoute('users');
    }

//    public function deleteAllAction(){
//        $user = $this->getUsersTable();
//        $user->deleteAllUser();
//        return $this->redirect()->toRoute('users');
//    }
//    
//    public  function addUserAction(){
//        $username = $_POST['username'];
//        $password = $_POST['password'];
//        $fullname = $_POST['fullname'];
//        $email = $_POST['email'];
//        $phone = $_POST['phone'];
//        $building = $_POST['building'];
//        $packet = $_POST['packet'];
//        $created = date();
//        $room = $_POST['room'];
//        $user = $this->getUsersTable();
//        $u = new Users();
//        $u->setUsername($username);
//        $u->setPassword($password);
//        $u->setFullname($fullname);
//        $u->setEmail($email);
//        $u->setPhone($phone);
//        $u->setBuilding($building);
//        $u->setPacket($packet);
//        $u->setCreated($created);
//        $u->setRoom($room);
//        $user->save($u);
//        return $this->redirect()->toRoute('users');
//    }
//    public function deleteAction(){
//        $id = $_GET['id'];
//        $user = $this->getUsersTable();
//        $user->deleteUser($id);
//        return $this->redirect()->toRoute('users');
//    }
//    
//    public function editAction(){
//        $id = $_GET['id'];
//        $user = $this->getUsersTable();
//        $user = $user->getUser($id);
//        $category = $this->getAppProductsTable();
//        $category = $category->fetchAll();
//        return new ViewModel(array(
//            'packet'=>$category,
//            'user'=>$user
//        ));
//    }  
//    public function editUserAction(){
//        $username = $_POST['username'];
//        $id = $_POST['id'];
//        $password = $_POST['password'];
//        $fullname = $_POST['fullname'];
//        $email = $_POST['email'];
//        $phone = $_POST['phone'];
//        $building = $_POST['building'];
//        $packet = $_POST['packet'];
//        $room = $_POST['room'];
//        $created = date('dd/mm/yyyy');
//        $user = $this->getUsersTable();
//        $u = new Users();
//        $u->setUsername($username);
//        $u->setPassword($password);
//        $u->setFullname($fullname);
//        $u->setEmail($email);
//        $u->setPhone($phone);
//        $u->setBuilding($building);
//        $u->setPacket($packet);
//        $u->setCreated($created);
//        $u->setRoom($room);
//        $check = $this->getRadCheckTable();
//        $usr = $user->getUser($id);
//        $check2 = $check->getName($usr->getUsername());
//        $check->removeCheck($check2->getId());
//        $u2 = new RadCheck();
//        $u2->setUsername($username);
//        $u2->setAttribute($check2->getAttribute());
//        $u2->setValue($email);
//        $u2->setOp(':=');
//        $check->save($u2);
//        $u->setId($id);
//        $user->deleteUser($id);
//        $user->save($u);
//        return $this->redirect()->toRoute('users');
//    }

    public function deleteAllAction() {
        $user = $this->getUsersTable();
        $user->deleteAllUser();
        return $this->redirect()->toRoute('users');
    }

    public function getUsersTable() {
        if (!$this->usersTable):
            $sm = $this->getServiceLocator();
            $this->usersTable = $sm->get('Dashboard\Model\UsersTable');
        endif;
        return $this->usersTable;
    }

    public function getRadCheckTable() {
        if (!$this->radCheckTable):
            $sm = $this->getServiceLocator();
            $this->radCheckTable = $sm->get('Dashboard\Model\RadCheckTable');
        endif;
        return $this->radCheckTable;
    }

    public function getUsersCodeTable() {
        if (!$this->usersCodeTable):
            $sm = $this->getServiceLocator();
            $this->usersCodeTable = $sm->get('Dashboard\Model\UsersCodeTable');
        endif;
        return $this->usersCodeTable;
    }

}
