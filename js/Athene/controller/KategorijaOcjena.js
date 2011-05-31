Ext.define('Athene.controller.KategorijaOcjena', {
    extend: 'Ext.app.Controller',
    
    views: [
        'kategorijaocjena.List',
        'kategorijaocjena.Form'
    ],
    
    stores: [
        'KategorijaOcjena'
    ],
    
    models: [
        'KategorijaOcjena'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#kategorijaocjenagrid'
        }
    ],
    
    init: function() {
        
        this.control({
            '#kategorijaocjenagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openKategorijaOcjenaForm': {
                click: function() {
                    var view = Ext.widget('kategorijaocjenaform');
                    view.show();
                }
            }
        });
    },
    
    onGridRendered: function() {
        //console.log('Grid is rendered, loading data...');
        this.getKategorijaOcjenaStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('kategorijaocjenaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#kategorijaocjenalist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },

    refreshData: function() {
        this.getKategorijaOcjenaStore().load();
    }
})