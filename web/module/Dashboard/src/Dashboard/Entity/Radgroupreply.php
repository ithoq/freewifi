<?php

namespace Dashboard\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Radgroupreply
 *
 * @ORM\Table(name="radgroupreply", indexes={@ORM\Index(name="groupname", columns={"groupname"})})
 * @ORM\Entity
 */
class Radgroupreply
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="groupname", type="string", length=64, nullable=false)
     */
    private $groupname = '';

    /**
     * @var string
     *
     * @ORM\Column(name="attribute", type="string", length=64, nullable=false)
     */
    private $attribute = '';

    /**
     * @var string
     *
     * @ORM\Column(name="op", type="string", length=2, nullable=false)
     */
    private $op = '=';

    /**
     * @var string
     *
     * @ORM\Column(name="value", type="string", length=253, nullable=false)
     */
    private $value = '';


}
