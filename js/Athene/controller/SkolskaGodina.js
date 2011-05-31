Ext.define('Athene.controller.SkolskaGodina', {
    extend: 'Ext.app.Controller',
    
    views: [
        'skolskagodina.List',
        'skolskagodina.Form'
    ],
    
    stores: [
        'SkolskaGodina'
    ],
    
    models: [
        'SkolskaGodina'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#skgodgrid'
        }
    ],
    
    init: function() {
        //console.log('SkolskaGodina controller initialized.')
        
        this.control({
            '#skgodgrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openSkGodForm': {
                click: function() {
                    var view = Ext.widget('skgodform');
                    view.show();
                }
            }
        });
    },
    
    onGridRendered: function() {
        //console.log('Grid is rendered, loading data...');
        this.getSkolskaGodinaStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    },
    
    edit: function(v, r) {
        var view = Ext.widget('skgodform');
        view.down('form').loadRecord(r);
        view.renderTo = '#skgodlist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },
    refreshData: function() {
        this.getSkolskaGodinaStore().load();
    }
})