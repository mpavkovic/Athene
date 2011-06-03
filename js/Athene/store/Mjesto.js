Ext.define('Athene.store.Mjesto', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Mjesto',
    pageSize: 20,
    sorters: [
        {
            property: 'naziv'
        }
    ],
    totalProperty: 'total'
});