Ext.define('Athene.controller.DodijeljenaPoteskoca', {
    extend: 'Ext.app.Controller',
    
    views: [
        'dodijeljenapoteskoca.List',
        'dodijeljenapoteskoca.Form'
    ],
    
    stores: [
        'DodijeljenaPoteskoca',
        'Poteskoca'
    ],
    
    models: [
        'DodijeljenaPoteskoca',
        'Poteskoca'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#dodijeljenapoteskocagrid'
        }
    ],
    
    init: function() {
        
        this.control({
            '#dodijeljenapoteskocagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openDodijeljenaPoteskocaForm': {
                click: function() {
                    var view = Ext.widget('dodijeljenapoteskocaform');
                    view.show();
                }
            }
        });
    },
    
    onGridRendered: function() {
        this.getPoteskocaStore().load({
            scope: this,
            callback: function(records, operation, success) {
                if(success) {
                    this.getDodijeljenaPoteskocaStore().load();
                } else {
                    Ext.widget('notification').popup({
                        message: 'Nemogu učitati dodijeljene poteskoce!',
                        icon: 'img/icons/exclamation.png'
                    });
                    this.getWindow().close();
                }
            }
        });
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('dodijeljenapoteskocaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#dodijeljenapoteskocalist';
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})