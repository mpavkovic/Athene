Ext.define('Athene.store.Dogadjaj', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Dogadjaj',
    proxy: {
        type: 'direct',
        directFn: Dogadjaj.getAll
    },
    sorters: [
        {
            property: 'naziv',
			property: 'datum'
        }
    ]
});