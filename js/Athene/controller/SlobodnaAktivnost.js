Ext.define('Athene.controller.SlobodnaAktivnost', {
    extend: 'Ext.app.Controller',
    
    views: [
        'slobodnaaktivnost.List',
        'slobodnaaktivnost.Form'
    ],
    
    stores: [
        'SlobodnaAktivnost'
    ],
    
    models: [
        'SlobodnaAktivnost'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#slobodnaaktivnostgrid'
        }
    ],
    
    init: function() {
        //console.log('Slobodna aktivnost controller initialized.')
        
        this.control({
            '#slobodnaaktivnostgrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openSlobodnaAktivnostForm': {
                click: function() {
                    var view = Ext.widget('slobodnaaktivnostform');
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
        var view = Ext.widget('slobodnaaktivnostform');
        view.down('form').loadRecord(r);
        view.renderTo = '#slobodnaaktivnostlist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})