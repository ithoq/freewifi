<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Dashboard\Model;

use Dashboard\Model\AppOrders;
use Zend\Db\TableGateway\TableGateway;
use Dashboard\Model\Mapper\MapperTable;

class AppOrdersTable extends MapperTable {

    protected $tableGateway;

    public function __construct(TableGateway $tableGateway) {
        $this->tableGateway = $tableGateway;
        parent::__construct($tableGateway);
    }

    public function find($modulename) {
        $rowSet = $this->tableGateway->select(array('name' => $modulename));
        $row = $rowSet->current();
        if (!$row):
            return false;
        endif;
        return $row;
    }

    public function findById($id) {
        $rowSet = $this->tableGateway->select(array('id' => $id));
        $row = $rowSet->current();
        if (!$row):
            return false;
        endif;
        return $row;
    }

    public function fetchAll() {
        $resultSet = $this->tableGateway->select();
        $result = array();
        while ($row = $resultSet->current()):
            $result[] = $row;
            $resultSet->next();
        endwhile;
        return $result;
    }

    public function save(AppOrders $order) {
        
        $data = array(
            'customerid' => $order->getCustomerid(),
            'orderdate' => $order->getOrderdate(),
            'status' => $order->getStatus(),
            'sumtotal' => $order->getSumtotal(),
        );
        $id = $order->getOrderid();
        if (!$id):
            $this->tableGateway->insert($data);
            return $this->tableGateway->getLastInsertValue();
        else:
            $this->update($data, array('orderid' => $id ));
            return $id;
        endif;
        
    }

}
