using MasterFloor.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MasterFloor.ViewModel
{
    internal class HistoryViewModel
    {
        ObservableCollection<PartnerProduct> historyList = new ObservableCollection<PartnerProduct>();
        public ObservableCollection<PartnerProduct> HistoryList
        {
            get { return historyList; }
            set
            {
                historyList = value;
            }
        }

        public void LoadHistory(Partners partner)
        {
            using (var context = new masterFloorEntities2())
            {
                var history = context.PartnerProduct.Where((productPartner)=>productPartner.PartnerId== partner.Id).ToList();
                HistoryList.Clear();
                foreach (var item in history)
                {
                    HistoryList.Add(item);
                }
            }
        }
    }
}
