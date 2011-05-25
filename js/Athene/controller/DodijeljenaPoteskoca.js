Ext.define('Athene.controller.DodijeljenaPoteskoca', {
    extend: 'Ext.app.Controller',
    
    views: [
        'dodijeljenapoteskoca.List',
        'dodijeljenapoteskoca.Form'
    ],
    
    stores: [
        'DodijeljenaPoteskoca'
    ],
    
    models: [
        'DodijeljenaPoteskoca'
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
        this.getList().store.load();
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('dodijeljenapoteskocaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#dodijeljenapoteskocalist';
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})