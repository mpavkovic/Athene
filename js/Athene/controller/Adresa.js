Ext.define('Athene.controller.Adresa', {
    extend: 'Ext.app.Controller',
    
    views: [
        'adresa.List',
        'adresa.Form'
    ],
    
    stores: [
        'Adresa',
        'Mjesto',
        'RazlogBoravista',
        'Ucenik'
    ],
    
    models: [
        'Adresa',
        'Mjesto',
        'RazlogBoravista',
        'Ucenik'
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
                },
            },
			'#helpAdresaList': {
                click: this.help
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
    },

    help: function() {
        Ext.Ajax.request({
            url: 'help/adresalist.html',
            success: function(response) {
                var view = Ext.widget('helpwindow');
                view.update(response.responseText);
                view.setTitle(view.title + 'Popis adresa (učenika)');
                view.show();
            },
            failure: function() {
                Ext.Msg.alert("Greška", "Nemogu učitati pomoć za zatraženu stavku.");
            }
        })
    }
})