Ext.define('Athene.controller.VrstaPutnika', {
    extend: 'Ext.app.Controller',
    
    views: [
        'vrstaputnika.List',
        'vrstaputnika.Form'
    ],
    
    stores: [
        'VrstaPutnika'
    ],
    
    models: [
        'VrstaPutnika'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#vrstaputnikagrid'
        }
    ],
    
    init: function() {
        //console.log('Vrsta Putnika controller initialized.')
        
        this.control({
            '#vrstaputnikagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openVrstaPutnikaForm': {
                click: function() {
                    var view = Ext.widget('vrstaputnikaform');
                    view.show();
                }
            }
        });
    },
    
    onGridRendered: function() {
        //console.log('Grid is rendered, loading data...');
        this.getVrstaPutnikaStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('vrstaputnikaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#vrstaputnikalist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },
    refreshData: function() {
        this.getVrstaPutnikaStore().load();
    }
})