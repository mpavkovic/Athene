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
            },
			'#helpIzostanak': {
                click: this.help
            }
        });
    },
    
    onGridRendered: function() {
        //console.log('Grid is rendered, loading data...');
        this.getIzostanakStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('izostanakform');
        view.down('form').loadRecord(r);
        view.renderTo = '#izostanaklist';
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },

    help: function() {
        Ext.Ajax.request({
            url: 'help/izostanci.html',
            success: function(response) {
                var view = Ext.widget('helpwindow');
                view.update(response.responseText);
                view.setTitle(view.title + 'Izostanci');
                view.show();
            },
            failure: function() {
                Ext.Msg.alert("Greška", "Nemogu uèitati pomoæ za zatraženu stavku.");
            }
        })
    },
	
    refreshData: function() {
        this.getIzostanakStore().load();
    }
})