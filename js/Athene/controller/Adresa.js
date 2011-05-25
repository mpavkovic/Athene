Ext.define('Athene.controller.Adresa', {
    extend: 'Ext.app.Controller',
    
    views: [
        'adresa.List',
        'adresa.Form'
    ],
    
    stores: [
        'Adresa'
    ],
    
    models: [
        'Adresa'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#adresagrid'
        }
    ],
    
    init: function() {
        
        this.control({
            '#adresagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openAdresaForm': {
                click: function() {
                    var view = Ext.widget('adresaform');
                    view.show();
                }
            }
        });
    },
    
    onGridRendered: function() {
        this.getList().store.load();
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('adresaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#adresalist';
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})