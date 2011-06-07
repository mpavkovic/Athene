Ext.define('Athene.controller.Menu', {
    extend: 'Ext.app.Controller',
    
    views: [
        'menu.Side',
	'menu.List',
	'menu.Form'
    ],
    
    stores: [
	'Menu',
	'MenuCombo'
    ],
    
    models: [
	'Menu'
    ],
    
    init: function() {
        
        this.control({
            'sidemenu': {
                itemclick: function(menu, record) {
                    if(record.data.leaf == true) {
                        _id = record.data.id;
                        _win = _id.substring(_id.lastIndexOf("/")+1);
			
                        var view = Ext.WindowManager.get(_win);
                        if(view === undefined) {
			    if(Ext.ComponentManager.isRegistered(_win)) {
				view = Ext.widget(_win);
				Ext.getCmp('workspace').add(view);
				view.show();
				MessageBus.fireEvent('log', 'Test message');
			    } else {
				console.error('Widget ' + _win + ' is not registered!');
			    }
                        } else if(!view.isVisible()) {
			    view.show();
			}
                    }
                }
            },
            '#grid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
	    '#openForm': {
		click: this.openForm
	    },
	    'button[action]': {
		click: this.submitForm
	    },
	    '#refresh': {
		click: function() {
		    this.getMenuStore().load();
		}
	    }/*,
	    '#openHelp': {
		click: this.help('menulist.html')
	    }*/
        })
    },
    
    onGridRendered: function() {
        this.getMenuStore().load();
    },
    
    edit: function(v, r) {  
	var view;
	if(Ext.WindowManager.get('menuform')) {
	    view = Ext.WindowManager.get('menuform');
	} else {
	    view = Ext.widget('menuform');
	    Ext.getCmp('workspace').add(view);
	}
	view.down('form').loadRecord(r);
	var button = view.down('button[action=save]');
	if(button) {
	    button.setText('Spremi');
	    button.action = 'update';
	}
	view.setTitle('Izmijeni: ' + r.data.label);
	view.show();  
    },
    
    openForm: function() {
	var view;
	if(Ext.WindowManager.get('menuform')) {
	    view = Ext.WindowManager.get('menuform');
	    view.down('form').getForm().reset();
	    var button = view.down('button[action=update]');
	    if(button) {
		button.setText('Dodaj');
		button.action = 'save';
	    }
	    view.setTitle('Novi izbornik');
	} else {
	    view = Ext.widget('menuform');
	    Ext.getCmp('workspace').add(view);
	}
	view.show();
    },
    
    submitForm: function(button) {
	var form = button.up('window').down('form').getForm(); // shorthand
	if(form.isValid()) {
	    if(button.action == 'save') {
	        var Menu = this.getMenuModel();
		var menu = new Menu(form.getValues());
		menu.save({
		    success: function() {
			Ext.widget('notification').popup('Izbornik dodan.');
			this.getMenuStore().sync();
		    }
		});
		this.getMenuStore().load();
	    } else if(button.action == 'update') {
		var menu = form.getRecord();
		menu.set(form.getValues());
		menu.save({
		    success: function() {
			Ext.widget('notification').popup('Izbornik spremljen.');
			this.getMenuStore().sync();
		    }
		});
		this.getMenuStore().load();
	    }
	    button.up('window').close();
	}
    },
    
    help: function() {
        Ext.Ajax.request({
            url: 'help/menulist.html',
            success: function(response) {
                var view = Ext.widget('helpwindow');
                view.update(response.responseText);
                view.setTitle(view.title + 'Popis izbornika');
                view.show();
            },
            failure: function() {
                Ext.Msg.alert("Greška", "Nemogu učitati pomoć za zatraženu stavku.");
            }
        })
    }
    
});