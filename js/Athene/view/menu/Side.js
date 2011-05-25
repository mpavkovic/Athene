Ext.define('Athene.view.menu.Side', {
    extend: 'Ext.tree.Panel',
    alias: 'widget.sidemenu',
    expandAll: true,
    store: Ext.create('Ext.data.TreeStore', {
        model: 'MenuItem',
        proxy: {
            type: 'ajax',
            url: 'ext.php'
        },
        root: {
            text: 'Izbornik',
            id: 'sidemenu',
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