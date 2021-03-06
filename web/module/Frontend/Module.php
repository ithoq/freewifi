<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Frontend;

use Zend\ModuleManager\Feature\ConfigProviderInterface;
use Zend\ModuleManager\Feature\AutoloaderProviderInterface;

class Module implements ConfigProviderInterface, AutoLoaderProviderInterface {

    public function getAutoloaderConfig() {
        return array(
            'Zend\Loader\ClassMapAutoloader' => array(
                __DIR__ . '/autoload_classmap.php',
            ),
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    //'Dashboard' => __DIR__ . '../../Dashboard/src/Dashboard',
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                    
                    //'Model\Table' => __DIR__ . '../../Dashboard/src/Dashboard',
                    
                ),
            ),
        );
    }

    public function getConfig() {
        
        return include __DIR__ . '/config/module.config.php';
    }

//    public function getServiceConfig() {
//        return array(
//            'factories' => array(
//                'Registry\Model\UsersTable' => function($sm) {
//                    $tableGateway = $sm->get('UsersTableGateway');
//                    $table = new UsersTable($tableGateway);
//                    return $table;
//                },
//                'UsersTableGateway' => function($sm) {
//                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
//                    $resultSetPrototype = new ResultSet();
//                    $resultSetPrototype->setArrayObjectPrototype(new Users());
//                    return new TableGateway('app_users', $dbAdapter, null, $resultSetPrototype);
//                },
//                'Registry\Model\UsersCodeTable' => function($sm) {
//                    $tableGateway = $sm->get('UsersCodeTableGateway');
//                    $table = new UsersCodeTable($tableGateway);
//                    return $table;
//                },
//                'UsersCodeTableGateway' => function($sm) {
//                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
//                    $resulSetPrototype = new ResultSet();
//                    $resulSetPrototype->setArrayObjectPrototype(new UsersCode());
//                    return new TableGateway('app_active_code', $dbAdapter, null, $resulSetPrototype);
//                },
//                'Registry\Model\RadCheckTable' => function($sm) {
//                    $tableGateway = $sm->get('RadCheckTableGateway');
//                    $table = new RadCheckTable($tableGateway);
//                    return $table;
//                },
//                'RadCheckTableGateway' => function($sm) {
//                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
//                    $resultSetPrototype = new ResultSet();
//                    $resultSetPrototype->setArrayObjectPrototype(new RadCheck());
//                    return new TableGateway('radcheck',$dbAdapter,null,$resultSetPrototype);
//                }
//            ),
//        );
//    }

}
