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
        //console.log('Grid is rendered, loading data...');
        this.getDodijeljenaPoteskocaStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    },
    
    edit: function(v, r) {
        var view = Ext.widget('dodijeljenapoteskocaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#dodijeljenapoteskocalist';
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },
	
    refreshData: function() {
        this.getDodijeljenaPoteskocaStore().load();
    }
})