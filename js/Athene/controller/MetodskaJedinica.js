Ext.define('Athene.controller.MetodskaJedinica', {
    extend: 'Ext.app.Controller',
    
    views: [
        'metodskajedinica.List',
        'metodskajedinica.Form'
    ],
    
    stores: [
        'MetodskaJedinica'
    ],
    
    models: [
        'MetodskaJedinica'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#metodskajedinicagrid'
        }
    ],
    
    init: function() {
        
        this.control({
            '#metodskajedinicagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openMetodskaJedinicaForm': {
                click: function() {
                    var view = Ext.widget('metodskajedinicaform');
                    view.show();
                }
            }
        });
    },
    
    onGridRendered: function() {
        //console.log('Grid is rendered, loading data...');
        this.getMetodskaJedinicaStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('metodskajedinicaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#metodskajedinicalist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },

    refreshData: function() {
        this.getMetodskaJedinicaStore().load();
    }
})