*Describe
	sum Y LW K M E VA3 
	sum m_stability m_infrastructure m_informal m_corrupt m_trade m_tax1 m_opening m_labor m_share_bank_wk m_courts m_crime distance_market distance_port population age eduworker capacityu
quietly{
sort country city
	by country city: sum Y LW K M E VA1 
	by country city: sum m_stability m_infrastructure m_informal m_corrupt m_trade m_tax1 m_opening m_labor m_share_bank_wk m_courts m_crime distance_market distance_port population age eduworker capacityu
}
