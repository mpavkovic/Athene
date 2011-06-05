Ext.define('Athene.controller.Adresa', {
    extend: 'Ext.app.Controller',
    
    views: [
        'adresa.List',
        'adresa.Form'
    ],
    
    stores: [
        'Adresa',
        'Ucenik',
        'Mjesto'
    ],
    
    models: [
        'Adresa',
        'Ucenik',
        'Mjesto'
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
            },
            '#refreshAdresaList': {
                click: this.refreshData
            }
        });
    },
    
    onGridRendered: function() {
        //console.log('Grid is rendered, loading data...');
        this.getAdresaStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    }, 
    
    /*edit: function(v, r) {
        var view = Ext.widget('adresaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#adresalist';
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },*/
    edit: function(v, r) {
        
        var view = Ext.widget('adresaform')
        view.down('form').getForm().findField('ucenik_id').store.load({
            callback: function() {
                view.down('form').loadRecord(r);
                view.down('#formAdresaSubmit').text = 'Spremi';
                view.renderTo = '#adresalist';
                view.show();        
            }
        }),
        view.down('form').getForm().findField('mjesto_id').store.load({
            callback: function() {
                view.down('form').loadRecord(r);
                view.down('#formAdresaSubmit').text = 'Spremi';
                view.renderTo = '#adresalist';
                view.show();        
            }
        });
        
    },
    
    refreshData: function() {
        this.getAdresaStore().load();
    }
})