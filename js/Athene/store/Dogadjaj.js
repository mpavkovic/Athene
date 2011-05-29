Ext.define('Athene.store.Dogadjaj', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Dogadjaj',
    proxy: {
        type: 'direct',
        directFn: Dogadjaj.getAll,
        reader: {
            root: 'data'
        }
    },
    sorters: [
        {
            property: 'naziv',
			property: 'datum'
        }
    ]
});