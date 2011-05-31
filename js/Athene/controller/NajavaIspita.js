Ext.define('Athene.controller.NajavaIspita', {
    extend: 'Ext.app.Controller',
    
    views: [
        'najavaispita.List',
        'najavaispita.Form'
    ],
    
    stores: [
        'NajavaIspita'
    ],
    
    models: [
        'NajavaIspita'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#najavaispitagrid'
        }
    ],
    
    init: function() {
        //console.log('Najava Ispita controller initialized.')
        
        this.control({
            '#najavaispitagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openNajavaIspitaForm': {
                click: function() {
                    var view = Ext.widget('najavaispitaform');
                    view.show();
                }
            },
			'#helpNajavaIspita': {
                click: this.help
            }
        });
    },
    
    onGridRendered: function() {
        //console.log('Grid is rendered, loading data...');
        this.getNajavaIspitaStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    },  
    
    edit: function(v, r) {
        var view = Ext.widget('najavaispitaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#najavaispitalist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },

    help: function() {
        Ext.Ajax.request({
            url: 'help/najavaispita.html',
            success: function(response) {
                var view = Ext.widget('helpwindow');
                view.update(response.responseText);
                view.setTitle(view.title + 'Najava ispita');
                view.show();
            },
            failure: function() {
                Ext.Msg.alert("Greška", "Nemogu učitati pomoć za zatraženu stavku.");
            }
        })
    },
    
    refreshData: function() {
        this.getNajavaIspitaStore().load();
    }
})