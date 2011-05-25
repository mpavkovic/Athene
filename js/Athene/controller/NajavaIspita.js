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
        console.log('Najava Ispita controller initialized.')
        
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
            }
        });
    },
    
    onGridRendered: function() {
        console.log('Grid is rendered, loading data...');
        this.getList().store.load();
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('najavaispitaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#najavaispitalist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})