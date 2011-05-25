Ext.define('Athene.controller.Drzava', {
    extend: 'Ext.app.Controller',
    
    views: [
        'drzava.List',
        'drzava.Form'
    ],
    
    stores: [
        'Drzava'
    ],
    
    models: [
        'Drzava'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#drzavagrid'
        }
    ],
    
    init: function() {
        
        this.control({
            '#drzavagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openDrzavaForm': {
                click: function() {
                    var view = Ext.widget('drzavaform');
                    view.show();
                }
            }
        });
    },
    
    onGridRendered: function() {
        this.getList().store.load();
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('drzavaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#drzavalist';
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})