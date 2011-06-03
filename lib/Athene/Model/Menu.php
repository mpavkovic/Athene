<?php

namespace Athene\Model;

use Athene\Model\Field\Integer as IntegerField;
use Athene\Model\Field\Text as TextField;
use Athene\Model\Field\Boolean as BooleanField;

class Menu extends Model {
    
    protected $table = 'athene_menu';
    
    public function init() {
        
        //$this->fields->id = new IntegerField();
        $this->setField('id', new IntegerField());
        
        //var_dump($this->fields);
        $this->fields->label = new TextField(array('maxLength' => 100));
        $this->fields->extId = new TextField(array('maxLength' => 100, 'mapping' => 'ext_id'));
        $this->fields->extCls = new TextField(array('maxLength' => 100, 'mapping' => 'ext_cls', 'required' => false));
        $this->fields->extLeaf = new BooleanField(array('mapping' => 'ext_leaf', 'default' => false));
        $this->fields->extExpanded = new BooleanField(array('mapping' => 'ext_expanded', 'default' => false));
        //$this->fields->parent = new ForeignKey('Menu');
        
    }
    
    public function sidemenu($params) {
        //var_dump($params);
        
        if($params->node != 'root') {
            $query = "SELECT id FROM athene_menu WHERE ext_id = '" . substr($params->node, strrpos($params->node, '/')+1) . "'";
            //echo $query;
            $r = $this->adapter->query($query);
            $parent = $r[0]->id;
        }
        
        $query = "SELECT am . * 
                    FROM  `athene_menu` am
                    JOIN athene_group_menu agm ON agm.menu_id = am.id
                    JOIN auth_group ag ON ag.id = agm.group_id
                    JOIN auth_user_groups aug ON ag.id = aug.group_id
                    WHERE aug.user_id = " . $_SESSION['id'];
        
        if($params->node != 'root') {
            $query .= " AND parent = " . $parent;
        } else {
            $query .= " AND parent = 0";
        }
        
        $result = $this->adapter->query($query);
        
        $return = array();
        
        foreach($result as $r) {
            $menuItem = (object)array(
                'id' => $params->node . '/' . $r->ext_id,
                'text' => $r->label,
                'cls' => $r->ext_cls,
                'leaf' => false,
                'expanded' => false
            );
            if($r->ext_leaf == 1) {
                $menuItem->leaf = true;
            }
            if($r->ext_expanded == 1) {
                $menuItem->expanded = true;
                array_merge($return, $this->sidemenu((object)array('node' => $params->node . '/' . $r->ext_id)));
            }
            $return[] = $menuItem;
        }
        
        return $return;
        
    }
    
}