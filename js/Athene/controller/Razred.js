Ext.define('Athene.controller.Razred', {
    extend: 'Ext.app.Controller',
    
    views: [
	'razred.List',
	'razred.Form'
    ],
    
    stores: [
	'Razred'
    ],
    
    models: [
	'Razred'
    ],
    
    init: function() {
        
        this.control({
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
		    this.getRazredStore().load();
		}
	    }
        })
    },
    
    onGridRendered: function(grid) {
        grid.store.load();
    },
    
    edit: function(v, r) {  
	var view;
	if(Ext.WindowManager.get('razredform')) {
	    view = Ext.WindowManager.get('razredform');
	} else {
	    view = Ext.widget('razredform');
	    Ext.getCmp('workspace').add(view);
	}
	view.down('form').loadRecord(r);
	var button = view.down('button[action=save]');
	if(button) {
	    button.setText('Spremi');
	    button.action = 'update';
	}
	view.setTitle('Izmijeni: ' + r.data.naziv);
	view.show();  
    },
    
    openForm: function() {
	var view;
	if(Ext.WindowManager.get('razredform')) {
	    view = Ext.WindowManager.get('razredform');
	    view.down('form').getForm().reset();
	    var button = view.down('button[action=update]');
	    if(button) {
		button.setText('Dodaj');
		button.action = 'save';
	    }
	    view.setTitle('Novi razred');
	} else {
	    view = Ext.widget('razredform');
	    Ext.getCmp('workspace').add(view);
	}
	view.show();
    },
    
    submitForm: function(button) {
	var form = button.up('window').down('form').getForm(); // shorthand
	if(form.isValid()) {
	    if(button.action == 'save') {
	        var Razred = this.getRazredModel();
		var razred = new Razred(form.getValues());
		razred.save({
		    success: function() {
			Ext.widget('notification').popup('Izbornik dodan.');
			this.getRazredStore().load();
		    }
		});
	    } else if(button.action == 'update') {
		var razred = form.getRecord();
		razred.set(form.getValues());
		razred.save({
		    success: function() {
			Ext.widget('notification').popup('Izbornik spremljen.');
			this.getRazredStore().load();
		    }
		});
	    }
	    button.up('window').close();
	}
    }
    
});