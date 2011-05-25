Ext.define('Athene.controller.Izostanak', {
    extend: 'Ext.app.Controller',
    
    views: [
        'izostanak.List',
        'izostanak.Form'
    ],
    
    stores: [
        'Izostanak'
    ],
    
    models: [
        'Izostanak'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#izostanakgrid'
        }
    ],
    
    init: function() {
        
        this.control({
            '#izostanakgrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openIzostanakForm': {
                click: function() {
                    var view = Ext.widget('izostanakform');
                    view.show();
                }
            }
        });
    },
    
    onGridRendered: function() {
        this.getList().store.load();
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('izostanakform');
        view.down('form').loadRecord(r);
        view.renderTo = '#izostanaklist';
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})