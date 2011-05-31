Ext.define('Athene.controller.Drzava', {
    extend: 'Ext.app.Controller',
    
    views: [
        'drzava.List',
        'drzava.Form'
    ],
    
    stores: [
        'Drzava',
        'DrzavaCombo'
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
        this.getDrzavaStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('drzavaform', {
            title: 'Izmijeni: ' + r.data.naziv,
            modal: true
        });
        view.down('form').loadRecord(r);
        view.renderTo = '#drzavalist';
        view.show();
    }
})