Ext.define('Athene.controller.NastavnaJedinica', {
    extend: 'Ext.app.Controller',
    
    views: [
        'nastavnajedinica.List',
        'nastavnajedinica.Form'
    ],
    
    stores: [
        'NastavnaJedinica'
    ],
    
    models: [
        'NastavnaJedinica'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#nastavnajedinicagrid'
        }
    ],
    
    init: function() {
        console.log('Nastavna Jedinica controller initialized.')
        
        this.control({
            '#nastavnajedinicagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openNastavnaJedinicaForm': {
                click: function() {
                    var view = Ext.widget('nastavnajedinicaform');
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
        var view = Ext.widget('nastavnajedinicaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#nastavnajedinicalist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})