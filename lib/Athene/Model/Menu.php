<?php

namespace Athene\Model;

use Athene\Model\Field\Integer as IntegerField;
use Athene\Model\Field\Text as TextField;
use Athene\Model\Field\Boolean as BooleanField;
use Athene\Model\Field\Reference as ReferenceField;

use Sirius\Storage\Storage;

class Menu extends Model {
    
    protected $table = 'athene_menu';
    
    public function init() {
        
        $this->setField('id', new IntegerField(array('primaryKey' => true, 'autoIncrement' => true)));
        $this->setField('label', new TextField(array('maxLength' => 100, 'required' => true)));
        $this->setField('extId', new TextField(array('maxLength' => 100, 'mapping' => 'ext_id', 'required' => true)));
        $this->setField('extCls', new TextField(array('maxLength' => 100, 'mapping' => 'ext_cls')));
        $this->setField('extLeaf', new BooleanField(array('mapping' => 'ext_leaf', 'default' => false)));
        $this->setField('extExpanded', new BooleanField(array('mapping' => 'ext_expanded', 'default' => false)));
        $this->setField('parent', new ReferenceField(array('model' => 'Menu')));
        
    }
    
    public function sidemenu($params) {
        //var_dump($params);
        $database = Storage::getStorage('database');
        
        if($params->node != 'root') {
            $query = "SELECT id FROM athene_menu WHERE ext_id = '" . substr($params->node, strrpos($params->node, '/')+1) . "'";
            //echo $query;
            $r = $database->query($query);
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
        
        $result = $database->query($query);
        
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