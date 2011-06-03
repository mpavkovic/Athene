Ext.define('Athene.view.menu.Side', {
    extend: 'Ext.tree.Panel',
    alias: 'widget.sidemenu',
    expandAll: true,
    store: Ext.create('Ext.data.TreeStore', {
        //model: 'Athene.model.MenuItem',
        proxy: {
            type: 'direct',
            directFn: Menu.sidemenu,
            //type: 'ajax',
            //url: 'ext.php',
            reader: {
                root: 'data'
            }
        },
        root: {
            text: 'Izbornik',
            //id: 'data',
            //id: 'sidemenu',
            expanded: true
        },
        folderSort: true,
        sorters: [{
            property: 'text',
            direction: 'ASC'
        }]
    }),
    useArrows: true
});