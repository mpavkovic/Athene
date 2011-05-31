Ext.define('Athene.controller.NastavniSat', {
    extend: 'Ext.app.Controller',
    
    views: [
        'nastavnisat.List',
        'nastavnisat.Form'
    ],
    
    stores: [
        'NastavniSat'
    ],
    
    models: [
        'NastavniSat'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#nastavnisatgrid'
        }
    ],
    
    init: function() {
        //console.log('Nastavni Sat controller initialized.')
        
        this.control({
            '#nastavnisatgrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openNastavniSatForm': {
                click: function() {
                    var view = Ext.widget('nastavnisatform');
                    view.show();
                }
            },
            '#openNastavniSatGrid': {
                click: function() {
                    var view = Ext.widget('nastavnisatlist');
                    view.show();
                }
            }
        });
    },
    
    onGridRendered: function() {
        //console.log('Grid is rendered, loading data...');
        this.getList().store.load();
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('nastavnisatform');
        view.down('form').loadRecord(r);
        view.renderTo = '#nastavnisatlist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})