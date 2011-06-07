Ext.define('Athene.view.Viewport', {
   extend: 'Ext.container.Viewport',
   layout: {
        type: 'border',
        padding: 5
    },
    // Define regions
    items: [
         // Header
         {
            region: 'north',
            height: 35, 
            border: 0,
	    layout: 'fit',
            padding: '0 0 5px 0',
            items: [
               {
                  xtype: 'toolbar',
		  addFill: true,
                  items: [
                    {
                        xtype: 'button',
			icon: 'img/icons/group.png',
                        text: 'Učenici',
			id: 'openUcenikGrid',
			tooltip: {text:'Popis učenika'}
                    },
                    {
                        xtype: 'button',
			icon: 'img/icons/book.png',
                        text: 'Razredi',
			id: 'openRazredGrid',
			tooltip: {text:'Popis razreda'}
                    },
                    {
                        xtype: 'button',
			icon: 'img/icons/time_add.png',
                        text: 'Nastavni sat',
			id: 'openNastavniSatGrid',
			tooltip: {text:'Popis razreda'}
                    },
		     {xtype: 'tbfill'},
                    {
                        xtype: 'button',
                        icon: 'img/icons/export_excel.png',
                        text: 'Export',
			id: 'export',
			handler: function() {
                           window.location = 'export/export.csv';
                        }
                    },
                    {
                        xtype: 'button',
						icon: 'img/icons/help.png',
                        text: 'Pomoć',
						id: 'openPomocForm',
						tooltip: {text:'Kako koristiti aplikaciju'}
                    },
					'-',
					{
                        xtype: 'tbtext',
                        html: 'Ulogirani ste kao: <b>' + USERNAME + '</b>'
                     },
                     {
                        icon: 'img/icons/lock_open.png',
                        text: 'Odjava',
                        id: 'logout'
                     }
                  ]
               }
            ]
         },
         // Sidebar navigation
         {
            region: 'west',
            collapsible: true,
            title: 'Izbornik',
            width: 200,
            layout: 'fit',
            items: [
               {
                  xtype: 'sidemenu',
                  border: false // hide the unneccesary border
               }
            ],
            listeners: {
               collapse: function(panel) {
                  Ext.WindowManager.each(function() {
                     //console.log(this.maximized);
                     if(this.maximized) {
                        //console.log('maxed');
                        this.maximized = false;
                        this.maximize();
                     }
                  });
               },
               expand: function(panel) {
                  Ext.WindowManager.each(function() {
                     //console.log(this.maximized);
                     if(this.maximized) {
                        //console.log('maxed');
                        this.maximized = false;
                        this.maximize();
                     }
                  });
               }
            }
        },
        {
            region: 'center',
            border: 0,
            bodyCls: 'workspace',
            id: 'workspace',
            items: [
               {
                  xtype: 'debugwindow'
               }
            ]
        }
    ]
});