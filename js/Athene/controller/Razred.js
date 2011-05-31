Ext.define('Athene.controller.Razred', {
    extend: 'Ext.app.Controller',
    
    views: [
        'razred.List',
        'Help',
		'razred.Form'
    ],
    
    stores: [
        'Razred'
    ],
    
    models: [
        'Razred'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#razredgrid'
        }
    ],
    
    init: function() {
        //console.log('Razred controller initialized.')
        
        this.control({
            '#razredgrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openRazredForm': {
                click: function() {
                    var view = Ext.widget('razredform');
                    view.show();
                }
            },
            '#openRazredGrid': {
                click: function() {
                    Ext.widget('razredlist').show();
                }
            },
            '#filterRazredBySkGod': {
                change: this.filter
            },
            '#filterRazredByRazrednik': {
                change: this.filter
            },
            '#helpRazredList': {
                click: this.help
            }
        });
    },
    
    onGridRendered: function() {
        //console.log('Grid is rendered, loading data...');
        this.getList().store.load();
    },
    
	edit: function(v, r) {
        var view = Ext.widget('razredform');
        view.down('form').loadRecord(r);
        view.renderTo = '#razredlist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },
    
    filter: function(item, newValue, oldValue) {
        //console.log('Filter by ' + newValue);
        this.getList().store.filter('skolska_godina_id', newValue);
    },

    filter: function(item, newValue, oldValue) {
        //console.log('Filter by ' + newValue);
        this.getList().store.filter('razrednik_id', newValue);
    },
    
    help: function() {
        Ext.Ajax.request({
            url: 'help/razredlist.html',
            success: function(response) {
                var view = Ext.widget('helpwindow');
                view.update(response.responseText);
                view.setTitle(view.title + 'Popis razreda');
                view.show();
            },
            failure: function() {
                Ext.Msg.alert("Greška", "Nemogu učitati pomoć za zatraženu stavku.");
            }
        })
    }
})