using UnityEngine;
using System.Collections;

public class DisableSelf : MonoBehaviour {
    public float lifeTime = 6f;

	void OnEnable()
    {
        StartCoroutine(Disable());
    }

    IEnumerator Disable()
    {
        yield return new WaitForSeconds(lifeTime);
        this.gameObject.SetActive(false);
    }
}
