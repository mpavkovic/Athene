Ext.define('Athene.controller.NastavnaJedinica', {
    extend: 'Ext.app.Controller',
    
    views: [
        'nastavnajedinica.List',
        'nastavnajedinica.Form'
    ],
    
    stores: [
        'NastavnaJedinica',
        'NastavniPlan'
    ],
    
    models: [
        'NastavnaJedinica',
        'NastavniPlan'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#nastavnajedinicagrid'
        }
    ],
    
    init: function() {
        //console.log('Nastavna Jedinica controller initialized.')
        
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
        //console.log('Grid is rendered, loading data...');
        this.getNastavnaJedinicaStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('predmetnacjelinaform');
        view.down('form').getForm().findField('nastavni_plan_id').store.load({
            callback: function() {
                view.down('form').loadRecord(r);
                view.down('#formNastavnaJedinicaSubmit').text = 'Spremi';
                view.renderTo = '#nastavnajedinicalist';
                view.show();        
            }
        });
    },
    
    refreshData: function() {
        this.getNastavnaJedinicaStore().load();
    }
})