using MasterFloor.Model;
using MasterFloor.View;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MasterFloor.ViewModel
{

    public class PartnerItem 
    {
        public Partners partner { get; set; } 
        public int discount { get; set; }
        public string type { get; set; }
        public string name { get; set; }
        public string director { get; set; }

        public string phone { get; set; }
        public string rating { get; set; }

        public PartnerItem(Partners partner)
        {
            this.partner= partner;
            this.type=partner.PartnerType.Name;
            this.name=partner.Name;
            this.phone=partner.Phone;
            this.director=partner.Person.LastName+" "+partner.Person.Name + " " + partner.Person.Surname;
            this.rating = partner.Rating.ToString();
            var count= partner.PartnerProduct.ToList().Sum((product) => product.Count);
            if (count <= 10000)
               this.discount = 0;
            else if (count <= 50000)
                this.discount = 5;
            else if (count <= 300000)
                this.discount = 10;
            else
                this.discount = 15;
        }

    }
    internal class PartnerViewModel
    {
        ObservableCollection<PartnerItem> partnersList=new ObservableCollection<PartnerItem>();
        public ObservableCollection<PartnerItem> PartnersList
        {
            get { return partnersList; }
            set
            {
                partnersList = value;
            }
        }

        public PartnerViewModel()
        {
            LoadPartners();
        }

        public void UpdatePartner(Partners updatedPartner) { 
           using (var db = new masterFloorEntities2())
            {
                var existingPartner = db.Partners.FirstOrDefault(p => p.Id == updatedPartner.Id);
                if (updatedPartner != null)
                {
                    existingPartner.Name = updatedPartner.Name;
                    existingPartner.Phone = updatedPartner.Phone;
                    existingPartner.Email = updatedPartner.Email;
                    existingPartner.Rating = updatedPartner.Rating;
                    db.SaveChanges();
                    LoadPartners();
                }
            }
        }

        public void LoadPartners()
        {
            using (var db = new masterFloorEntities2())
            {
                PartnersList.Clear();
                var partners = db.Partners.ToList();
                foreach (var partner in partners) { 
                    PartnersList.Add(new PartnerItem(partner));
                }
            }
        }
    }
}
